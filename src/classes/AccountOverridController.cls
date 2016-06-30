public class AccountOverridController 
{
    public String StrComponentName { get; set; }
    public String StrIFrameURL { get; set; }
    public String StrUrlResult { get; set; }
    public Map<String,String> MapParamNameByValue { get; set; }
    public Map<String,String> MapParamNameByParamVal { get; set; }
    public List<String> lstNewUrlParams { get; set; }
    public sObject sobj { get; set; }
    public List<String> setFields { get; set; }
    public AccountOverridController()
    {
        setFields = new List<String>();
        setFields.add('name');
        if( Account.getSObjectType().getDescribe().fields.getMap().keySet().contains('billingcountrycode') )
        {
			setFields.add('billingcountrycode');            
        }
        String strQuery = 'select ';
        for( integer iCount = 0; iCount < setFields.size(); iCount++ )
        {
            if( setFields.size() > iCount + 1 )
            	strQuery += setFields[iCount] + ', ';
            else
                strQuery += setFields[iCount] + ' ';
        }
        strQuery += 'FROM Account WHERE Id = \'' + ApexPages.CurrentPage().getParameters().get('id') + '\'';
        List<Account> lstAccounts = Database.query(strQuery);
        sObj = lstAccounts[0];
    }
    public void save()
    {
		insert sObj;        
    }
    /*
    public AccountOverridController(ApexPages.StandardController con)
    {
        lstNewUrlParams = new List<String>();
        //lstNewUrlParams = ApexPages.currentPage().getParameters().values();
        /*
        string accountId = ApexPages.currentPage().getParameters().get('id');
        string appId = ApexPages.currentPage().getParameters().get('appid');
        string quizId = ApexPages.currentPage().getParameters().get('quizid');
        MapParamNameByValue = new Map<String,String>();
     	if( accountId != null ) 
            MapParamNameByValue.put('id', accountId);
        if( appId != null ) 
            MapParamNameByValue.put('OpportunityId', appId);
        if( quizId != null ) 
            MapParamNameByValue.put('QuizId', quizId);
		
    }
	*/
    public ApexPages.Component getCustomComponent()
    {
        if( StrComponentName != null )
        {
         	Type reflector = Type.forName(StrComponentName);
            if( reflector != null )
            {
             	IComponentProvider provider = (IComponentProvider) reflector.newInstance();
            	return provider.provideComponent();              
            }
        }
        return null;
    }
    public void LoadIFrame()
    {
        if( StrIFrameURL != null )
        {
			
            StrUrlResult = StrIFrameURL.substring(StrIFrameURL.indexOf('?')+1, StrIFrameURL.length());
            //MapParamNameByParamVal = new Map<String,String>();
            for( String strParam : StrUrlResult.split('&') )
            {
                strParam = (strParam.split('=')[1]).substring(2);
                strParam = (strParam.split('}')[0]);
                strParam = strParam.remove('.');
                strParam = strParam.toLowerCase();
                lstNewUrlParams.add(strParam);
            }
            //lstNewUrlParams = MapParamNameByParamVal.values();
        }    
    }
}