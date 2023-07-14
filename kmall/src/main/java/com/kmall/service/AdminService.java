package com.kmall.service;

import com.kmall.domain.AdminVO;

public interface AdminService {

	AdminVO admin_ok(String admin_id);

	void now_visit(String admin_id);

}
