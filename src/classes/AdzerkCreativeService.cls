public with sharing class AdzerkCreativeService {

    public Integer AdvertiserId;
    public String Body;
    public String Url;
    public String Title;
    public Boolean IsSync;
    public Boolean IsDeleted;
    public Integer AdTypeId;
    public String Alt;
    public Boolean IsActive;
    
     public AdzerkCreativeService (JSONParser parser) {
         while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'AdvertiserId'){
                                            AdvertiserId=Integer.valueof(parser.getText());
                                            } else if (text == 'Body') {
                                             Body=parser.getText();
                                             } else if (text == 'Url') {
                                                Url=parser.getText();
                                             } else if (text == 'Title') {
                                                Title=parser.getText();
                                             }else if (text == 'IsSync') {
                                                IsSync=Boolean.Valueof(parser.getText());
                                             }else if (text == 'IsDeleted') {
                                                IsDeleted=Boolean.Valueof(parser.getText());
                                             }else if (text == 'AdTypeId') {
                                                AdTypeId=Integer.Valueof(parser.getText());
                                             }else if (text == 'Alt') {
                                                Alt=parser.getText();
                                             }else if (text == 'IsActive') {
                                                IsActive=Boolean.Valueof(parser.getText());
                                             }
                                         }
                                   }
                            }
   
         }    
     //Get Creative Data from Adzerk 
     public AdzerkCreativeService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
     }        
     public AdzerkCreativeService (String accessToken, String id) {
                this(accessToken, id, null);
     }
     //Create Creative on Adzerk    
     public AdzerkCreativeService CreateCreative (String accessToken, String id, Map<String, String> params) {
                return new AdzerkCreativeService (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
     }
     //Update Creative on Adzerk    
     public AdzerkCreativeService UpdateCreative(String accessToken, String id, Map<String, String> params) {
                return new AdzerkCreativeService (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
     }
     public static AdzerkCreativeService parse(String json) {
                return new AdzerkCreativeService(System.JSON.createParser(json));
     }
    
    static testMethod void testParse() {
        String json = '{'+
        '  \"AdvertiserId\":123,'+
        '  \"Body\":\"Test\",'+
        '  \"Url\":\"http://adzerk.com\",'+
        '  \"Title\":\"Test creative\",'+
        '  \"IsSync\":false,'+
        '  \"IsDeleted\":false,'+
        '  \"AdTypeId\":1,'+
        '  \"Alt\":\"test\",'+
        '  \"IsActive\":true'+
        '}';
        AdzerkCreativeService obj = parse(json);
        System.assert(obj != null);
    }
}