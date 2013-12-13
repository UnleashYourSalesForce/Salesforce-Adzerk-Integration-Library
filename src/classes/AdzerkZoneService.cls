public class AdzerkZoneService  {
    public class Items {
    public Integer Id;
    public String Name;
    public Integer SiteId;

    
    public Items (JSONParser parser) {
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
  }
   
   public Integer PageNumber;
    public Integer PageSize;
    public Integer TotalPages;
    public Integer TotalItems;
    public List<Items> Items;   
    
    public AdzerkZoneService  (JSONParser parser) {
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
    
    //Get Zone Data from Adzerk
    public AdzerkZoneService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
    }
    public AdzerkZoneService (String accessToken, String id) {
                this(accessToken, id, null);
    }
    //Create Zone on Adzerk    
     public AdzerkZoneService.Items  CreateSite (String accessToken, String id, Map<String, String> params) {
                return new AdzerkZoneService.Items  (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
     }
     //Update Zone on Adzerk    
     public AdzerkZoneService.Items  UpdateSite(String accessToken, String id, Map<String, String> params) {
                return new AdzerkZoneService.Items  (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
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