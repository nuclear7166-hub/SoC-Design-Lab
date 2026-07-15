
// WinIDTView.cpp : CWinIDTView 클래스의 구현
//

#include "stdafx.h"
// SHARED_HANDLERS는 미리 보기, 축소판 그림 및 검색 필터 처리기를 구현하는 ATL 프로젝트에서 정의할 수 있으며
// 해당 프로젝트와 문서 코드를 공유하도록 해 줍니다.
#ifndef SHARED_HANDLERS
#include "WinIDT.h"
#endif

#include "WinIDTDoc.h"
#include "WinIDTView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define		COM_BUF_MAX				2048

char    gCommRcvBuffer[COM_BUF_MAX]="";
int     gComIndex=0;
HWND    hCommWnd;


// CWinIDTView

IMPLEMENT_DYNCREATE(CWinIDTView, CFormView)

BEGIN_MESSAGE_MAP(CWinIDTView, CFormView)
	ON_BN_CLICKED(IDC_BT_COM_OPEN, &CWinIDTView::OnBnClickedBtComOpen)
	ON_BN_CLICKED(IDC_BT_COM_CLOSE, &CWinIDTView::OnBnClickedBtComClose)
	ON_BN_CLICKED(IDC_BT_CMD1, &CWinIDTView::OnBnClickedBtCmd1)
	ON_BN_CLICKED(IDC_BT_CMD2, &CWinIDTView::OnBnClickedBtCmd2)
	ON_BN_CLICKED(IDC_BT_CMD3, &CWinIDTView::OnBnClickedBtCmd3)
	ON_BN_CLICKED(IDC_BT_CLEAR, &CWinIDTView::OnBnClickedBtClear)
	ON_MESSAGE(WM_COMM_READ, &CWinIDTView::OnCommRead)    // Communication Message Handleer
	ON_WM_CTLCOLOR()
	ON_WM_DRAWITEM()
	ON_BN_CLICKED(IDC_RADIO_PARITY, &CWinIDTView::OnBnClickedRadioParity)
	ON_BN_CLICKED(IDC_RADIO_PARITY2, &CWinIDTView::OnBnClickedRadioParity2)
	ON_BN_CLICKED(IDC_RADIO_PARITY3, &CWinIDTView::OnBnClickedRadioParity3)
	ON_BN_CLICKED(IDC_RADIO_STOP_BIT0, &CWinIDTView::OnBnClickedRadioStopBit0)
	ON_BN_CLICKED(IDC_RADIO_STOP_BIT1, &CWinIDTView::OnBnClickedRadioStopBit1)
	ON_EN_CHANGE(IDC_EDIT_MESSAGE2, &CWinIDTView::OnEnChangeEditMessage2)
	ON_EN_UPDATE(IDC_EDIT_MESSAGE2, &CWinIDTView::OnEnUpdateEditMessage2)
	ON_BN_CLICKED(IDC_BT_CLEAR2, &CWinIDTView::OnBnClickedBtClear2)
END_MESSAGE_MAP()

// CWinIDTView 생성/소멸

CWinIDTView::CWinIDTView()
	: CFormView(CWinIDTView::IDD)
	, m_nComPort(0)
	, m_nBaudRate(0)
	, m_nComState(0)
	, m_nParity(0)
	, m_nStopBit(0)
{
	// TODO: 여기에 생성 코드를 추가합니다.

}

CWinIDTView::~CWinIDTView()
{
}

void CWinIDTView::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_CB_COM_NUM, m_cbComPort);
	DDX_Control(pDX, IDC_CB_BAUD_RATE, m_cbBaudRate);
	DDX_Control(pDX, IDC_BT_COM_STATE, m_btSerialStatus);
	DDX_Control(pDX, IDC_EDIT_MESSAGE, m_editMessage);
	DDX_Radio(pDX, IDC_RADIO_PARITY, m_nParity);
	DDX_Radio(pDX, IDC_RADIO_STOP_BIT0, m_nStopBit);
	DDX_Control(pDX, IDC_EDIT_MESSAGE2, m_editMessage2);
}

BOOL CWinIDTView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: CREATESTRUCT cs를 수정하여 여기에서
	//  Window 클래스 또는 스타일을 수정합니다.

	return CFormView::PreCreateWindow(cs);
}

void CWinIDTView::OnInitialUpdate()
{
	CFormView::OnInitialUpdate();
	GetParentFrame()->RecalcLayout();
	ResizeParentToFit();

	hCommWnd = m_hWnd;
	LoadUserData();

	CString sComPort =_T("");
	for(int i=0; i<20; i++)
	{
		sComPort.Format(_T("COM%d                        "), i+1);
		m_cbComPort.AddString(sComPort);
	}
	m_cbComPort.SetCurSel(m_nComPort);

	m_cbBaudRate.AddString(_T("4800                    "));
	m_cbBaudRate.AddString(_T("9600                    "));
	m_cbBaudRate.AddString(_T("19200                   "));
	m_cbBaudRate.AddString(_T("38400                   "));
	m_cbBaudRate.AddString(_T("57600                   "));
	m_cbBaudRate.AddString(_T("76800                   "));
	m_cbBaudRate.AddString(_T("115200                  "));
	m_cbBaudRate.AddString(_T("230400                  "));
	m_cbBaudRate.AddString(_T("460800                  "));
	m_cbBaudRate.AddString(_T("921600                  "));
	m_cbBaudRate.AddString(_T("1843200                 "));
	m_cbBaudRate.AddString(_T("3686400                 "));
	m_cbBaudRate.SetCurSel(m_nBaudRate);

	m_bmpPlay.LoadBitmap(IDB_BITMAP_PLAY);
	m_bmpStop.LoadBitmap(IDB_BITMAP_STOP);

	m_btSerialStatus.SetBitmap(m_bmpStop);
	m_editMessage.SetLimitText(0);
}


// CWinIDTView 진단

#ifdef _DEBUG
void CWinIDTView::AssertValid() const
{
	CFormView::AssertValid();
}

void CWinIDTView::Dump(CDumpContext& dc) const
{
	CFormView::Dump(dc);
}

CWinIDTDoc* CWinIDTView::GetDocument() const // 디버그되지 않은 버전은 인라인으로 지정됩니다.
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CWinIDTDoc)));
	return (CWinIDTDoc*)m_pDocument;
}
#endif //_DEBUG


// CWinIDTView 메시지 처리기


void CWinIDTView::OnBnClickedBtComOpen()
{
	CString com_port, msg, msg2;
	DWORD	baud_rate[] = {4800, 9600, 19200, 38400, 57600, 76800, 115200, 230400, 460800, 921600, 1843200, 3686400};

	if(m_nComState==0)
	{
		m_nComPort = m_cbComPort.GetCurSel();
		m_nBaudRate  = m_cbBaudRate.GetCurSel() ;
		com_port.Format(_T("//./COM%d"), m_nComPort+1);

		if(!(m_comm.OpenPort(com_port, baud_rate[m_nBaudRate], 1, (BYTE)m_nParity, (BYTE)m_nStopBit)))
		{
			msg.Format(_T("\r\n COM%d open fail \r\n"), m_nComPort+1);
			UpdateMessage(msg);
		}
		else
		{
			m_nComState = 1;
			msg.Format(_T("\r\n COM%d open, "), m_nComPort+1);

			msg2.Format(_T(" %d, "), baud_rate[m_nBaudRate]);
			msg += msg2;

			if(m_nParity==0)  	    msg2.Format(_T(" Parity : None, "));
			else if(m_nParity==1)  	msg2.Format(_T(" Parity : Odd, "));
			else if(m_nParity==2)  	msg2.Format(_T(" Parity : Even, "));
			msg += msg2;

			if(m_nStopBit==0)  	    msg2.Format(_T(" 1-Stop Bit \r\n"));
			else if(m_nStopBit==2) 	msg2.Format(_T(" 2-Stop Bits \r\n"));
			msg += msg2;

			UpdateMessage(msg);
			m_btSerialStatus.SetBitmap(m_bmpPlay);
			SaveUserData();
		}
	}
	else	;
}


void CWinIDTView::OnBnClickedBtComClose()
{
	CString msg;
	if(m_nComState)
	{
		m_comm.ClosePort();
		msg.Format(_T("\r\n COM%d close.."), m_nComPort+1);
		UpdateMessage(msg);
		m_nComState = 0;
		m_btSerialStatus.SetBitmap(m_bmpStop);
	}
	else	;
}


void CWinIDTView::OnBnClickedBtCmd1()
{
	SendCommand(1);
}


void CWinIDTView::OnBnClickedBtCmd2()
{
	SendCommand(2);
}


void CWinIDTView::OnBnClickedBtCmd3()
{
	SendCommand(3);
}


void CWinIDTView::OnBnClickedBtClear()
{
	for(int i=0; i<100; i++)
	{
		UpdateMessage(_T("                                               \r\n"));
	}

	m_editMessage.SetSel(0, -1);
	m_editMessage.Clear();
	m_editMessage.LineScroll(m_editMessage.GetLineCount());
}


void CWinIDTView::UpdateMessage(CString msg)
{
	int nLength = m_editMessage.GetWindowTextLengthA();
	m_editMessage.SetSel(nLength, nLength);
	m_editMessage.ReplaceSel(msg);
}


void CWinIDTView::SendCommand(int flag)
{
	BYTE sbuf[200];
	CString sBuffer = _T("") ;

	::ZeroMemory(gCommRcvBuffer, sizeof(gCommRcvBuffer));

	switch(flag)
	{
	case 1 :	// command - 1
		sBuffer.Format(_T("0123456789 \r\n"));
		break;
	case 2 :	// command - 2
		sBuffer.Format(_T("ABCDEFGHIJKLMNOPQRSTUVWXYZ \r\n"));
		break;
	case 3 :	// command - 3
		sBuffer.Format(_T("abcdefghijklmnopqrstuvwxyz \r\n"));
		break;
	default :
		break;
	}

	for(int i=0; i<sBuffer.GetLength(); i++)
		sbuf[i] = (BYTE)sBuffer.GetAt(i);

	m_comm.WriteComm(sbuf, sBuffer.GetLength());
}

LONG CWinIDTView::OnCommRead(UINT wParam, LONG lParam)
{
	BYTE aByte;
	unsigned char EndofMsg = 13;
	int i;
	CString msg;

	int size= (m_comm.m_QueueRead).GetSize();
	if(size == 0)
		return 0;
	else	;

	for(i=0; i<size; i++)
	{
		(m_comm.m_QueueRead).GetByte(&aByte);
		if( aByte!= NULL )		gCommRcvBuffer[i]= aByte;
		else { i--; size--; }
	}
	msg.Format(_T("%s"), gCommRcvBuffer);
	UpdateMessage(msg);
	memset(gCommRcvBuffer, 0, COM_BUF_MAX);		// Very Important

	return 0;
}


HBRUSH CWinIDTView::OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor)
{
	HBRUSH hbr = CFormView::OnCtlColor(pDC, pWnd, nCtlColor);

	switch (nCtlColor)
    {
		case CTLCOLOR_STATIC :
		case CTLCOLOR_LISTBOX :
		case CTLCOLOR_EDIT :
		case CTLCOLOR_MSGBOX :
		case CTLCOLOR_SCROLLBAR :
			pDC->SetTextColor(RGB(255, 255, 255));
			pDC->SetBkColor(RGB(50, 50, 50));
			//pDC->SetBkMode(TRANSPARENT);
			return (HBRUSH)GetStockObject(NULL_BRUSH);
		default:
			hbr = CreateSolidBrush(RGB(50, 50, 50));
			return hbr;
    }
}


void CWinIDTView::OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct)
{
	if ( (nIDCtl==IDC_BT_COM_OPEN) ||
		 (nIDCtl==IDC_BT_COM_CLOSE) ||
		 (nIDCtl==IDC_BT_COM_STATE) ||
		 (nIDCtl==IDC_BT_CLEAR) 	 )
	{
		CDC dc;

		dc.Attach(lpDrawItemStruct ->hDC);
		RECT rect;
		rect= lpDrawItemStruct ->rcItem;

		dc.FillSolidRect(&rect,RGB(100,100,100));
		UINT state=lpDrawItemStruct->itemState;

		if((state & ODS_SELECTED))
		{
			dc.DrawEdge(&rect,EDGE_SUNKEN,BF_RECT);

		}
		else
		{
			dc.DrawEdge(&rect,EDGE_RAISED,BF_RECT);
		}

		dc.SetBkColor(RGB(100,100,255));
		dc.SetTextColor(RGB(255,255,255));
		dc.SetBkMode( TRANSPARENT );

		TCHAR buffer[MAX_PATH];
		ZeroMemory(buffer,MAX_PATH );
		::GetWindowText(lpDrawItemStruct->hwndItem,buffer,MAX_PATH);
		dc.DrawText(buffer,&rect,DT_CENTER|DT_VCENTER|DT_SINGLELINE);

		dc.Detach();
	}				

	CFormView::OnDrawItem(nIDCtl, lpDrawItemStruct);
}


void CWinIDTView::SaveUserData(void)
{
	errno_t err;
	FILE *fp;

	err = fopen_s(&fp, _T("user_data.dat"), "wt");
	if(err == 0)
	{
		fprintf_s(fp, "%d\r\n", m_nComPort);
		fprintf_s(fp, "%d\r\n", m_nBaudRate);
		fclose(fp);
	}
	else	;
}


void CWinIDTView::LoadUserData(void)
{
	errno_t err;
	FILE *fp;

	err = fopen_s(&fp, _T("user_data.dat"), "rt");
	if(err == 0)
	{
		fscanf_s(fp, "%d", &m_nComPort);
		fscanf_s(fp, "%d", &m_nBaudRate);
		fclose(fp);
	}
	else
	{
		m_nComPort = 5;
		m_nBaudRate = 6;
	}
}


void CWinIDTView::OnBnClickedRadioParity()
{
	m_nParity = 0;
}


void CWinIDTView::OnBnClickedRadioParity2()
{
	m_nParity = 1;
}


void CWinIDTView::OnBnClickedRadioParity3()
{
	m_nParity = 2;
}


void CWinIDTView::OnBnClickedRadioStopBit0()
{
	m_nStopBit = 0;
}


void CWinIDTView::OnBnClickedRadioStopBit1()
{
	m_nStopBit = 2;
}


void CWinIDTView::OnEnChangeEditMessage2()
{
	// TODO:  RICHEDIT 컨트롤인 경우, 이 컨트롤은
	// CFormView::OnInitDialog() 함수를 재지정 
	//하고 마스크에 OR 연산하여 설정된 ENM_CHANGE 플래그를 지정하여 CRichEditCtrl().SetEventMask()를 호출하지 않으면
	// 이 알림 메시지를 보내지 않습니다.

	// TODO:  여기에 컨트롤 알림 처리기 코드를 추가합니다.
	CString sText, sText2;
	m_editMessage2.GetWindowTextA(sText);

	sText2 = sText.Right(1);
	BYTE sbuf[4];
	for(int i=0; i<sText2.GetLength(); i++)
		sbuf[i] = (BYTE)sText2.GetAt(i);

	m_comm.WriteComm(sbuf, sText2.GetLength());

}


void CWinIDTView::OnEnUpdateEditMessage2()
{
	// TODO:  RICHEDIT 컨트롤인 경우, 이 컨트롤은
	// CFormView::OnInitDialog() 함수를 재지정 
	//하여, IParam 마스크에 OR 연산하여 설정된 ENM_SCROLL 플래그를 지정하여 컨트롤에 EM_SETEVENTMASK 메시지를 보내지 않으면
	// 편집 컨트롤이 바뀐 텍스트를 표시하려고 함을 나타냅니다.

	// TODO:  여기에 컨트롤 알림 처리기 코드를 추가합니다.
}


void CWinIDTView::OnBnClickedBtClear2()
{
	int nLength;
	for(int i=0; i<20; i++)
	{
		nLength = m_editMessage2.GetWindowTextLengthA();
		m_editMessage2.SetSel(nLength, nLength);
		m_editMessage2.ReplaceSel(_T("                                                \r\n"));
	}

	m_editMessage2.SetSel(0, -1);
	m_editMessage2.Clear();
	m_editMessage2.LineScroll(m_editMessage2.GetLineCount());
}
