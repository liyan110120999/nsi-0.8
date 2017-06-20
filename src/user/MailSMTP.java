package user;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailSMTP {
    private static final String ALIDM_SMTP_HOST = "smtpdm.aliyun.com";
    private static final int ALIDM_SMTP_PORT = 25;

    public static void sendSmtpMail() throws MessagingException {
        // ���÷����ʼ��Ļ�������
        final Properties props = new Properties();
        // ��ʾSMTP�����ʼ�����Ҫ���������֤
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", ALIDM_SMTP_HOST);
        props.put("mail.smtp.port", ALIDM_SMTP_PORT);   
        // ���ʹ��ssl����ȥ��ʹ��25�˿ڵ����ã�������������, 
        // props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        // props.put("mail.smtp.socketFactory.port", "465");
        // props.put("mail.smtp.port", "465");
        
        // �����˵��˺�
        props.put("mail.user", "service@mail.html9.top");
        // ����SMTP����ʱ��Ҫ�ṩ������
        props.put("mail.password", "Xinxueshuo123Mail");

        // ������Ȩ��Ϣ�����ڽ���SMTP���������֤
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // �û���������
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
        // ʹ�û������Ժ���Ȩ��Ϣ�������ʼ��Ự
        Session mailSession = Session.getInstance(props, authenticator);
//		�򿪵���
        mailSession.setDebug(true);
        // �����ʼ���Ϣ
        MimeMessage message = new MimeMessage(mailSession);
        // ���÷�����
        InternetAddress form = new InternetAddress(
                props.getProperty("mail.user"));
        message.setFrom(form);

        // �����ռ���
        InternetAddress to = new InternetAddress("1453485414@qq.com");
        message.setRecipient(MimeMessage.RecipientType.TO, to);

        // �����ʼ�����
        message.setSubject("�����ʼ�");
        // �����ʼ���������
        message.setContent("���Ե�HTML�ʼ�", "text/html;charset=UTF-8");
        // �����ʼ�
        Transport.send(message);
    }
}