module gunshot_sound(
    input clk,
    input trigger,
    output reg buzzer_out
);
    // 1비트 상태 머신 정의 (IDLE: 대기, PLAY: 사격음 재생)
    localparam IDLE = 1'b0;
    localparam PLAY = 1'b1;
    reg state = IDLE;

    reg [23:0] duration_counter = 0;
    reg [31:0] tone_counter = 0;
    reg [31:0] tone_limit = 0;

    always @(posedge clk) begin
        case (state)
            IDLE: begin
                // 대기 상태에서 모든 제어 레지스터를 명시적 초기화 (고착 방지)
                buzzer_out       <= 1'b0;
                tone_counter     <= 0;
                duration_counter <= 0;
                tone_limit       <= 32'd20000; // 초기 주파수 한계치 고정 (2.5kHz)
                
                if (trigger) begin
                    state <= PLAY; // 트리거 펄스 입력 시 즉각 재생 상태로 전이
                end
            end

            PLAY: begin
                // 15,000,000 틱 제한 (100MHz 클럭 기준 정확히 150ms 동안 재생)
                if (duration_counter >= 24'd14999999) begin 
                    state <= IDLE; // 재생 종료 후 대기 상태로 복귀 및 레지스터 리셋 유도
                end else begin
                    duration_counter <= duration_counter + 1'b1;
                    
                    // 우측 비트 시프트(>> 7)를 통한 정밀한 선형 주파수 감쇄 (Pitch Drop)
                    tone_limit <= 32'd20000 + (duration_counter >> 7);
                    
                    // 수동 부저 구동용 가변 주파수 PWM 생성 서킷
                    if (tone_counter >= tone_limit) begin
                        tone_counter <= 0;
                        buzzer_out   <= ~buzzer_out; // 토글을 통한 음향 스퀘어 웨이브 출력
                    end else begin
                        tone_counter <= tone_counter + 1'b1;
                    end
                end
            end
            
            default: state <= IDLE;
        endcase
    end
endmodule