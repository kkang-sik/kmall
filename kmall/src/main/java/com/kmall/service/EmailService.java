package com.kmall.service;

import com.kmall.dto.EmailDTO;

public interface EmailService {

	void sendMail(EmailDTO dto, String message);
}
