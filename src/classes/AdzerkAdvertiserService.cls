public class AdzerkAdvertiserService {

    public String Title;
    public Boolean IsDeleted;
    public Boolean IsActive;

    public AdzerkAdvertiserService(JSONParser parser) {
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