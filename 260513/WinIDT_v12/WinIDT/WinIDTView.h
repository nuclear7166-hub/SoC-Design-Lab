
// WinIDTView.h : CWinIDTView 클래스의 인터페이스
//

#pragma once

#include "resource.h"
#include "afxwin.h"
#include "commthread.h"


class CWinIDTView : public CFormView
{
protected: // serialization에서만 만들어집니다.
	CWinIDTView();
	DECLARE_DYNCREATE(CWinIDTView)

public:
	enum{ IDD = IDD_WINIDT_FORM };

// 특성입니다.
public:
	CWinIDTDoc* GetDocument() const;

// 작업입니다.
public:

// 재정의입니다.
public:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 지원입니다.
	virtual void OnInitialUpdate(); // 생성 후 처음 호출되었습니다.

// 구현입니다.
public:
	virtual ~CWinIDTView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// 생성된 메시지 맵 함수
protected:
	DECLARE_MESSAGE_MAP()
public:
	CComboBox m_cbComPort;
	CComboBox m_cbBaudRate;
	CEdit m_editMessage;
	CButton m_btSerialStatus;
	afx_msg void OnBnClickedBtComOpen();
	afx_msg void OnBnClickedBtComClose();
	afx_msg void OnBnClickedBtCmd1();
	afx_msg void OnBnClickedBtCmd2();
	afx_msg void OnBnClickedBtCmd3();
	afx_msg void OnBnClickedBtClear();
	afx_msg LONG OnCommRead(UINT, LONG);		// Serial Message
	CBitmap m_bmpPlay;
	CBitmap m_bmpStop;
	CCommThread m_comm;
	int m_nComPort;
	int m_nBaudRate;
	int m_nComState;
	void UpdateMessage(CString msg);
	void SendCommand(int flag);
	afx_msg HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);
	afx_msg void OnDrawItem(int nIDCtl, LPDRAWITEMSTRUCT lpDrawItemStruct);
	void SaveUserData(void);
	void LoadUserData(void);
	int m_nParity;
	int m_nStopBit;
	afx_msg void OnBnClickedRadioParity();
	afx_msg void OnBnClickedRadioParity2();
	afx_msg void OnBnClickedRadioParity3();
	afx_msg void OnBnClickedRadioStopBit0();
	afx_msg void OnBnClickedRadioStopBit1();
	afx_msg void OnEnChangeEditMessage2();
	afx_msg void OnEnUpdateEditMessage2();
	CEdit m_editMessage2;
	afx_msg void OnBnClickedBtClear2();
};

#ifndef _DEBUG  // WinIDTView.cpp의 디버그 버전
inline CWinIDTDoc* CWinIDTView::GetDocument() const
   { return reinterpret_cast<CWinIDTDoc*>(m_pDocument); }
#endif

