public with sharing class AdzerkGeoTargetingService {
    public Integer LocationId;
    public Integer FlightId;
    public String CountryCode;
    public String Region;
    public Integer MetroCode;
    public Boolean IsExclude;

     public AdzerkGeoTargetingService(JSONParser parser) {
        while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'LocationId'){
                                            LocationId=Integer.Valueof(parser.getText());
                                            } else if (text == 'FlightId') {
                                             FlightId= Integer.Valueof(parser.getText());
                                             } else if (text == 'CountryCode') {
                                                CountryCode=parser.getText();
                                             }else if (text == 'Region') {
                                                Region=parser.getText();
                                             }else if (text == 'MetroCode') {
                                                MetroCode=Integer.Valueof(parser.getText());
                                             }else if (text == 'IsExclude') {
                                                IsExclude=Boolean.Valueof(parser.getText());
                                             }
                                         }
                                   }
                            }
    }
    public AdzerkGeoTargetingService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
        }
        
        public AdzerkGeoTargetingService (String accessToken, String id) {
                this(accessToken, id, null);
        }
    public static AdzerkGeoTargetingService parse(String json) {
        return new AdzerkGeoTargetingService(System.JSON.createParser(json));
    }
    
    static testMethod void testParse() {
        String json = '{'+
        '  \"LocationId\":12345,'+
        '  \"FlightId\":1234,'+
        '  \"CountryCode\":\"US\",'+
        '  \"Region\":\"NC\",'+
        '  \"MetroCode\":560,'+
        '  \"IsExclude\":false'+
        '}';
        AdzerkGeoTargetingService obj = parse(json);
        System.assert(obj != null);
    }
}