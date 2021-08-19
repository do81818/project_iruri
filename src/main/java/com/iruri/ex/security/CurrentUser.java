package com.iruri.ex.security;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.security.core.annotation.AuthenticationPrincipal;

@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
@AuthenticationPrincipal(expression = "#this == 'anonymousUser' ? null : currentUser")
public @interface CurrentUser {

}

/*
 *  servel-context.xml
 *  annotation-driven 에 아래 코드 추가
 *
 *  <argument-resolvers>
 *    <beans:bean class="org.springframework.security.web.method.annotation.AuthenticationPrincipalArgumentResolver" />
 *  </argument-resolvers>
 * 
 */
