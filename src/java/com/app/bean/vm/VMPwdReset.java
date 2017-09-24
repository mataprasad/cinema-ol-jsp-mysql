package com.app.bean.vm;

public class VMPwdReset {

    private String Step = "";
    private String txtUserName = "";
    private String txtSA = "";
    private String txtRePass = "";
    private String txtCurrentPass = "";
    private String txtNewRePass = "";

    public String getStep() {
        return Step;
    }

    public void setStep(String Step) {
        this.Step = Step;
    }

    public String getTxtUserName() {
        return txtUserName;
    }

    public void setTxtUserName(String txtUserName) {
        this.txtUserName = txtUserName;
    }

    public String getTxtSA() {
        return txtSA;
    }

    public void setTxtSA(String txtSA) {
        this.txtSA = txtSA;
    }

    public String getTxtRePass() {
        return txtRePass;
    }

    public void setTxtRePass(String txtRePass) {
        this.txtRePass = txtRePass;
    }

    public String getTxtCurrentPass() {
        return txtCurrentPass;
    }

    public void setTxtCurrentPass(String txtCurrentPass) {
        this.txtCurrentPass = txtCurrentPass;
    }

    public String getTxtNewRePass() {
        return txtNewRePass;
    }

    public void setTxtNewRePass(String txtNewRePass) {
        this.txtNewRePass = txtNewRePass;
    }
}
