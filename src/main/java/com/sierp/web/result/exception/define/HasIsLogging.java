package com.sierp.web.result.exception.define;

/**
 * 예외 객체별로 로깅 여부를 재정의할수 있는 인터페이스
 *
 */
public interface HasIsLogging {

    public boolean isLogging();
}
