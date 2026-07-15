#include "xparameters.h"
#include "xuartlite_l.h"
#include "xil_io.h"

// 문서 71페이지의 xparameters.h 주소 맵핑
#define AXI_SERVO_BASEADDR 0x44A00000
#define UART_BASEADDR XPAR_UARTLITE_0_BASEADDR

int main() {
    char rx_buf[10];
    int buf_idx = 0;
    int current_angle = 90;
    int duty = 16;

    // 초기 서보 모터 위치 (90도 중앙 정렬)
    Xil_Out32(AXI_SERVO_BASEADDR, duty);

    while (1) {
        // UART 수신 버퍼에 데이터가 있는지 논블로킹(Non-blocking)으로 확인
        if (!XUartLite_IsReceiveEmpty(UART_BASEADDR)) {
            char c = XUartLite_RecvByte(UART_BASEADDR);

            // 파이썬 코드에서 보낸 줄바꿈 문자('\n')를 만날 때까지 버퍼에 저장
            if (c == '\n') {
                rx_buf[buf_idx] = '\0';

                // 프로토콜 검증: 첫 글자가 'X'인지 확인
                if (rx_buf[0] == 'X') {
                    // "X090" 형태의 문자열에서 숫자 부분만 파싱
                    current_angle = (rx_buf[1] - '0') * 100 +
                                    (rx_buf[2] - '0') * 10 +
                                    (rx_buf[3] - '0');

                    // 각도 클램핑 (방어적 프로그래밍)
                    if (current_angle < 0) current_angle = 0;
                    if (current_angle > 180) current_angle = 180;

                    // 각도(0~180)를 문서 기반 Duty 값(7~26)으로 선형 보간 매핑
                    duty = 7 + (current_angle * 19) / 180;

                    // AXI 버스를 통해 하드웨어 IP로 Duty 값 전송
                    Xil_Out32(AXI_SERVO_BASEADDR, duty);
                }
                buf_idx = 0; // 버퍼 인덱스 초기화
            } else {
                if (buf_idx < 9) rx_buf[buf_idx++] = c;
            }
        }
    }
    return 0;
}
