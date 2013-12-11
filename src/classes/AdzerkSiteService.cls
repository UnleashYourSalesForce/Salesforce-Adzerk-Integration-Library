public class AdzerkSiteService  {

    public Integer Id;
    public String Title;
    public String Url;
    public Integer PublisherAccountId;

    
    public AdzerkSiteService(JSONParser parser) {
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
     public AdzerkSiteService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
        }
        
        public AdzerkSiteService (String accessToken, String id) {
                this(accessToken, id, null);
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