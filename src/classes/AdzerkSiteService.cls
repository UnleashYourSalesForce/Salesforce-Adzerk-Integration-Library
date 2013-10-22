public class AdzerkSiteService  {

	public Integer Id;
	public String Title;
	public String Url;
	public Integer PublisherAccountId;

	
    public AdzerkSiteService(JSONParser parser) {
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