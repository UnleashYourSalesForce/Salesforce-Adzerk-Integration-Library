public class AdzerkSiteService  {

   public class Items {
    public Integer Id;
    public String Title;
    public String Url;
    public Integer PublisherAccountId;

    
    public Items (JSONParser parser) {
     while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'Id'){
                                            Id=Integer.Valueof(parser.getText());
                                            } else if (text == 'Title') {
                                             Title=parser.getText();
                                             } else if (text == 'Url') {
                                                Url=parser.getText();
                                             }else if (text == 'PublisherAccountId') {
                                                PublisherAccountId=Integer.Valueof(parser.getText());
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
    
    
    public AdzerkSiteService (JSONParser parser) {
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
     public AdzerkSiteService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
     }        
     public AdzerkSiteService (String accessToken, String id) {
                this(accessToken, id, null);
     }
      //Create Login on Adzerk    
     public AdzerkSiteService.Items  CreateSite (String accessToken, String id, Map<String, String> params) {
                return new AdzerkSiteService.Items  (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
     }
     //Update Login on Adzerk    
     public AdzerkSiteService.Items  UpdateSite(String accessToken, String id, Map<String, String> params) {
                return new AdzerkSiteService.Items  (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
     } 
     public static AdzerkSiteService parse(String json) {
                return new AdzerkSiteService (System.JSON.createParser(json));
     }
    
    static testMethod void testParse() {
        String json = '{'+
        '  \"Id\":1234,'+
        '  \"Title\":\"Test Site\",'+
        '  \"Url\":\"http://www.adzerk.com\",'+
        '  \"PublisherAccountId\":123'+
        '}';
        AdzerkSiteService obj = parse(json);
        System.assert(obj != null);
    }
}