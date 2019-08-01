package aop;



import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.ibatis.common.logging.Log;
import com.ibatis.common.logging.LogFactory;

@Component
@Aspect
public class TestAop {
 private final Log logger = LogFactory.getLog(getClass());
 
 private void testPointcut() {
	 System.out.println("testPointcut()");
 }
 
 @Around("execution(* board.notice.*Controller.*(..))")
 public Object testAop(ProceedingJoinPoint pjp) throws Throwable {
	 System.out.println("전");
	 logger.debug("LOG4J 사용");
	 Object v = pjp.proceed();
	 System.out.println("후");
	 return v;
 }
}
