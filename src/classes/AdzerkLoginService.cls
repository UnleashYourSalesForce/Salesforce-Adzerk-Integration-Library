public class AdzerkLoginService {

	public Integer Id;
	public String Email;
	public String Password;
	public String Name;

	
	public AdzerkLoginService(JSONParser parser) {
    }
    
    public static AdzerkLoginService parse(String json) {
        return new AdzerkLoginService (System.JSON.createParser(json));
    }
	
	
	
	static testMethod void testParse() {
		String json = '{'+
		'    \"Id\":1234,'+
		'    \"Email\":\"test@adzerk.com\",'+
		'    \"Password\":\"somehashedpassword\",'+
		'    \"Name\":\"John Doe\"'+
		'}';
		AdzerkLoginService obj = parse(json);
		System.assert(obj != null);
	}
}