public class AdzerkFlightService {

	public class AdzerkGeoTargetingService {
		public String CountryCode;
		public String Region;
		public Integer MetroCode;
		public Boolean IsExclude;
	}

	public class AdzerkSiteZoneTargetingService {
		public Integer SiteId;
		public Integer ZoneId;
		public Boolean IsExclude;
	}

	public String StartDate;
	public String EndDate;
	public Boolean NoEndDate;
	public Double Price;
	public Integer Impressions;
	public Boolean IsUnlimited;
	public Boolean IsNoDuplicates;
	public Boolean IsFullSpeed;
	public String Keywords;
	public String UserAgentKeywords;
	public String Name;
	public Boolean IsFreqCap;
	public Integer CampaignId;
	public Integer PriorityId;
	public Boolean IsDeleted;
	public Boolean IsActive;
	public List<GeoTargeting> GeoTargeting;
	public List<SiteZoneTargeting> SiteZoneTargeting;
	public Integer ECPMOptimizePeriod;
	public Double ECPMMultiplier;
	public Double FloorECPM;
	public Double CeilingECPM;
	public Double DefaultECPM;
	public Integer ECPMBurnInImpressions;

	
    public AdzerkFlightService(JSONParser parser) {
    }
    
    public static AdzerkFlightService parse(String json) {
        return new AdzerkFlightService (System.JSON.createParser(json));
    }


	
	static testMethod void testParse() {
		String json = '{'+
		'  \"StartDate\":\"1/1/2011\",'+
		'  \"EndDate\":\"12/31/2011\",'+
		'  \"NoEndDate\":false,'+
		'  \"Price\":10.00,'+
		'  \"Impressions\":10000,'+
		'  \"IsUnlimited\":false,'+
		'  \"IsNoDuplicates\":false,'+
		'  \"IsFullSpeed\":false,'+
		'  \"Keywords\":\"test, test2\",'+
		'  \"UserAgentKeywords\":\"\",'+
		'  \"Name\":\"Test\",'+
		'  \"IsFreqCap\":false,'+
		'  \"CampaignId\":1234,'+
		'  \"PriorityId\":1234,'+
		'  \"IsDeleted\":false,'+
		'  \"IsActive\":true,'+
		'  \"GeoTargeting\":[{'+
		'    \"CountryCode\":\"US\",'+
		'    \"Region\":\"NC\",'+
		'    \"MetroCode\":560,'+
		'    \"IsExclude\":false'+
		'  }],'+
		'  \"SiteZoneTargeting\":[{'+
		'    \"SiteId\":123,'+
		'    \"ZoneId\":321,'+
		'    \"IsExclude\":false'+
		'  }],'+
		'  \"ECPMOptimizePeriod\":30,'+
		'  \"ECPMMultiplier\":1.25,'+
		'  \"FloorECPM\":0.15,'+
		'  \"CeilingECPM\":0.35,'+
		'  \"DefaultECPM\":0.28,'+
		'  \"ECPMBurnInImpressions\":1000'+
		'}';
		AdzerkFlightService obj = parse(json);
		System.assert(obj != null);
	}
}
