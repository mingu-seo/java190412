package aop;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TestAop {
	public TestAop() {
		System.out.println("여기?");
	}
	private final Log logger = LogFactory.getLog(getClass());
	
	@Around("execution(* board.notice.*Controller.*(..))")
	public Object testAop(ProceedingJoinPoint pjp) throws Throwable{
		System.out.println("전");
		logger.debug("LOG4J 사용");
		Object v = pjp.proceed();
		System.out.println("후");
		return v;
	}
}
