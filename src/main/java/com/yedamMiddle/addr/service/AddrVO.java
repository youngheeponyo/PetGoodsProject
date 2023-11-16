package com.yedamMiddle.addr.service;

public class AddrVO {
	private int addrNo;
	private int productOrderNo;
	private String addrAddress;
	private int addrFee;
	private String addrState;
	private String addrRequest;
	public int getAddrNo() {
		return addrNo;
	}
	public void setAddrNo(int addrNo) {
		this.addrNo = addrNo;
	}
	public int getProductOrderNo() {
		return productOrderNo;
	}
	public void setProductOrderNo(int productOrderNo) {
		this.productOrderNo = productOrderNo;
	}
	public String getAddrAddress() {
		return addrAddress;
	}
	public void setAddrAddress(String addrAddress) {
		this.addrAddress = addrAddress;
	}
	public int getAddrFee() {
		return addrFee;
	}
	public void setAddrFee(int addrFee) {
		this.addrFee = addrFee;
	}
	public String getAddrState() {
		return addrState;
	}
	public void setAddrState(String addrState) {
		this.addrState = addrState;
	}
	public String getAddrRequest() {
		return addrRequest;
	}
	public void setAddrRequest(String addrRequest) {
		this.addrRequest = addrRequest;
	}
	@Override
	public String toString() {
		return "AddrVO [addrNo=" + addrNo + ", productOrderNo=" + productOrderNo + ", addrAddress=" + addrAddress
				+ ", addrFee=" + addrFee + ", addrState=" + addrState + ", addrRequest=" + addrRequest + "]";
	}
	
}
