public class AdzerkZoneService  {

	public Integer Id;
	public String Name;
	public Integer SiteId;

	
    public AdzerkZoneService(JSONParser parser) {
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