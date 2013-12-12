public class AdzerkZoneService  {

    public Integer Id;
    public String Name;
    public Integer SiteId;

    
    public AdzerkZoneService(JSONParser parser) {
     while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'Id'){
                                            Id=Integer.Valueof(parser.getText());
                                            } else if (text == 'Name') {
                                             Name= parser.getText();
                                             } else if (text == 'SiteId') {
                                                SiteId=Integer.Valueof(parser.getText());
                                                }
                                         }
                                   }
                            }
    }
    //Get Zone Data from Adzerk
    public AdzerkZoneService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
    }
    public AdzerkZoneService (String accessToken, String id) {
                this(accessToken, id, null);
    }
    //Create Zone on Adzerk    
     public AdzerkZoneService CreateSite (String accessToken, String id, Map<String, String> params) {
                return new AdzerkZoneService (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
     }
     //Update Zone on Adzerk    
     public AdzerkZoneService UpdateSite(String accessToken, String id, Map<String, String> params) {
                return new AdzerkZoneService (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
     } 
    public static AdzerkZoneService parse(String json) {
               return new AdzerkZoneService (System.JSON.createParser(json));
    }
    
    static testMethod void testParse() {
        String json = '{'+
        '  \"Id\":1234,'+
        '  \"Name\":\"Test zone\",'+
        '  \"SiteId\":123'+
        '}';
        AdzerkZoneService obj = parse(json);
        System.assert(obj != null);
    }
}