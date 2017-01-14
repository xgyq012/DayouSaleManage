package com.dy.base.core;

import org.springframework.data.domain.AuditorAware;

public class AuditorAwareImpl implements AuditorAware {

	@Override
	public Object getCurrentAuditor() {

		return null ;
	}

}
