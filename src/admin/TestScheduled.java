package admin;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class TestScheduled {

	public class ScheduledExecutorTest implements Runnable {
	    private String jobName = "";
	 
	    public ScheduledExecutorTest(String jobName) {
	        super();
	        this.jobName = jobName;
	    }
	    //	 ִ��
	    @Override
	    public void run() {
	        System.out.println("execute ���Զ�ʱ��" + jobName);
	    }
	 
	    public void main(String[] args) {
	        ScheduledExecutorService service = Executors.newScheduledThreadPool(10);
	 
	        long initialDelay1 = 5;
	        long period1 = 3;
	        // �����ڿ�ʼ1����֮��ÿ��1����ִ��һ��job1
	        service.scheduleAtFixedRate(
	                new ScheduledExecutorTest("job1"), initialDelay1,
	                period1, TimeUnit.SECONDS);
	        		
	    }
	}
}
