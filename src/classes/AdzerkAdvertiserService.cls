public class AdzerkAdvertiserService {

    public String Title;
    public Boolean IsDeleted;
    public Boolean IsActive;

    public AdzerkAdvertiserService(JSONParser parser) {
    while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'Title'){
                                            Title=parser.getText();
                                            } else if (text == 'IsDeleted') {
                                             IsDeleted=Boolean.Valueof(parser.getText());
                                             } else if (text == 'IsActive') {
                                                IsActive=Boolean.Valueof(parser.getText());
                                                }
                                         }
                                   }
                            }
    }
    public AdzerkAdvertiserService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
        }
        
        public AdzerkAdvertiserService (String accessToken, String id) {
                this(accessToken, id, null);
        }
    public static AdzerkAdvertiserService parse(String json) {
        return new AdzerkAdvertiserService (System.JSON.createParser(json));
    }
    
    //As of Apex version 29 or is 28 or 27? Test methods must be in a separate test class
    /**
    static testMethod void testParse() {
        String json = '{'+
        '  \"Title\":\"Test advertiser\",'+
        '  \"IsDeleted\":false,'+
        '  \"IsActive\":true'+
        '}';
        AdzerkAdvertiserService obj = parse(json);
        System.assert(obj != null);
    }
    */
}