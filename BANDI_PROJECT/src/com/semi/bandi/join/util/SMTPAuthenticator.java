package com.semi.bandi.join.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class SMTPAuthenticator extends Authenticator{
 
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("qoxodnjs6@naver.com","rksqhrl123!@#");
    }
}

