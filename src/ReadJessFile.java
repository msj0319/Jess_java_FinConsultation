import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.*;

public class ReadJessFile {
	private String strFilePath = null;
	
	public ReadJessFile(String strFilePath)
	{
		this.strFilePath = strFilePath;
	}
	
	public String getJessFileContent()
	{
		try
		{
		    // ���Ϸ� ���� ����Ÿ�� �о�´�(����) 
			FileInputStream fis = new FileInputStream(this.strFilePath);
			BufferedReader brFileContents = new BufferedReader(new InputStreamReader(fis));
			String strFileContent = "";
			
			String strReturnValue = "";
			
			while(true)
			{				
				strFileContent = brFileContents.readLine();
				
				if(strFileContent == "" || strFileContent == null)
				{
					break;
				}
				else
				{
					strReturnValue += strFileContent + "\n";
				}
			}
			
			return "1" + strReturnValue.trim();
		}
		catch(FileNotFoundException fnfe)
		{
			return "0" + "������ ������ ã������ �����ϴ�!!!";
		}
		catch(IOException ioe)
		{
			return "0" + "������ �д� �������� ������ �߻��Ͽ����ϴ�!!!";
		}
	}
}

		
