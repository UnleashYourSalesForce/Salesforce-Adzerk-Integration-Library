public class AdzerkLoginService {

 public class Items {
      
    public Integer Id;
    public String Email;
    public String Password;
    public String Name;
    
    public Items(JSONParser parser) {
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
    }
    
    public Integer PageNumber;
    public Integer PageSize;
    public Integer TotalPages;
    public Integer TotalItems;
    public List<Items> Items;
    
    public AdzerkLoginService(JSONParser parser) {
     while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'PageNumber'){
                                            PageNumber= Integer.valueof(parser.getText());
                                            } else if (text == 'PageSize') {
                                             PageSize= Integer.valueof(parser.getText());
                                             } else if (text == 'TotalPages') {
                                              TotalPages= Integer.valueof(parser.getText());
                                             }else if (text == 'TotalItems') {
                                              TotalItems= Integer.valueof(parser.getText());
                                             }else if (text == 'Items ') {
                                                Items = new List<Items >();
                                               while (parser.nextToken() != JSONToken.END_ARRAY) {
                                              Items .add(new Items(parser));
                                               }
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
    public AdzerkLoginService.Items CreateLogin (String accessToken, String id, Map<String, String> params) {
                return new AdzerkLoginService.Items(System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
    }
     //Update Login on Adzerk    
     public AdzerkLoginService.Items UpdateLogin(String accessToken, String id, Map<String, String> params) {
                return new AdzerkLoginService.Items (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
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