package user;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dm.model.v20151123.SingleSendMailRequest;
import com.aliyuncs.dm.model.v20151123.SingleSendMailResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

public class MailAPI {
	
	public void sample() {        
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", "<your accessKey>", "<your accessSecret>");
        IAcsClient client = new DefaultAcsClient(profile);
        SingleSendMailRequest request = new SingleSendMailRequest();
        try {
            request.setAccountName("����̨�����ķ��ŵ�ַ");
             request.setFromAlias("�������ǳ�");
            request.setAddressType(1);
            request.setTagName("����̨�����ı�ǩ");
            request.setReplyToAddress(true);
            request.setToAddress("Ŀ���ַ");
            request.setSubject("�ʼ�����");
            request.setHtmlBody("�ʼ�����");
            SingleSendMailResponse httpResponse = client.getAcsResponse(request);
        } catch (ServerException e) {
            e.printStackTrace();
        }
        catch (ClientException e) {
            e.printStackTrace();
        }
    }
}
