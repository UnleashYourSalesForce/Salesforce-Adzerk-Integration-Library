public class AdzerkLoginService {
    public Integer Id;
    public String Email;
    public String Password;
    public String Name;
    
    public AdzerkLoginService(JSONParser parser) {
     while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'Id'){
                                            Id = Integer.valueof(parser.getText());
                                            } else if (text == 'Email') {
                                             Email = parser.getText();
                                             } else if (text == 'Password') {
                                              Password = parser.getText();
                                             }else if (text == 'Name') {
                                              Name = parser.getText();
                                             }
                                         }
                                 }
                       }
    }
    //Get Login Data from Adzerk
    public AdzerkLoginService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
    }        
    public AdzerkLoginService(String accessToken, String id) {
                this(accessToken, id, null);
    }  
    //Create Login on Adzerk    
    public AdzerkLoginService CreateLogin (String accessToken, String id, Map<String, String> params) {
                return new AdzerkLoginService (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
    }
     //Update Login on Adzerk    
     public AdzerkLoginService UpdateLogin(String accessToken, String id, Map<String, String> params) {
                return new AdzerkLoginService (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
    }  
    public static AdzerkLoginService parse(String json) {
                return new AdzerkLoginService (System.JSON.createParser(json));
    }
    
    
    
    static testMethod void testParse() {
        String json = '{'+
        '    \"Id\":1234,'+
        '    \"Email\":\"test@adzerk.com\",'+
        '    \"Password\":\"somehashedpassword\",'+
        '    \"Name\":\"John Doe\"'+
        '}';
        AdzerkLoginService obj = parse(json);
        System.assert(obj != null);
    }
}