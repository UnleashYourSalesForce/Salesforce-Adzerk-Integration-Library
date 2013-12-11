public class AdzerkAdTypeService {

    public class Items {
        public Integer Id;
        public Integer Height;
        public Integer Width;
        public String Name;
        
    public Items (JSONParser parser) {
     while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'Id'){
                                            Id=Integer.Valueof(parser.getText());
                                            } else if (text == 'Height') {
                                             Height= Integer.Valueof(parser.getText());
                                             } else if (text == 'Width') {
                                                Width=Integer.Valueof(parser.getText());
                                             }else if (text == 'Name') {
                                                Name=parser.getText();
                                             }
                                             
                                         }
                                   }
                            }
                  }        
    }

    public Integer page;
    public Integer pageSize;
    public Integer totalPages;
    public Integer totalItems;
    public List<Items> items;

    public AdzerkAdTypeService(JSONParser parser) {    
    while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'page'){
                                            page=Integer.Valueof(parser.getText());
                                            } else if (text == 'pageSize') {
                                             pageSize= Integer.Valueof(parser.getText());
                                             } else if (text == 'totalPages') {
                                                totalPages=Integer.Valueof(parser.getText());
                                             }else if (text == 'totalItems') {
                                                totalItems=Integer.Valueof(parser.getText());
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
    
    public static AdzerkAdTypeService parse(String json) {
        return new AdzerkAdTypeService (System.JSON.createParser(json));
    }
    
    static testMethod void testParse() {
        String json = '{'+
        '  \"page\": 1,'+
        '  \"pageSize\": 10,'+
        '  \"totalPages\": 1,'+
        '  \"totalItems\": 7,'+
        '  \"items\": ['+
        '    {'+
        '      \"Id\": 1,'+
        '      \"Height\": 90,'+
        '      \"Width\": 120,'+
        '      \"Name\": \"Button 1 and Text\"'+
        '    },'+
        '    {'+
        '      \"Id\": 2,'+
        '      \"Height\": 90,'+
        '      \"Width\": 120,'+
        '      \"Name\": \"Button 1\"'+
        '    },'+
        '    {'+
        '      \"Id\": 3,'+
        '      \"Height\": 60,'+
        '      \"Width\": 468,'+
        '      \"Name\": \"Full Banner\"'+
        '    },'+
        '    {'+
        '      \"Id\": 4,'+
        '      \"Height\": 90,'+
        '      \"Width\": 728,'+
        '      \"Name\": \"Leaderboard\"'+
        '    },'+
        '    {'+
        '      \"Id\": 5,'+
        '      \"Height\": 250,'+
        '      \"Width\": 300,'+
        '      \"Name\": \"Medium Rectangle\"'+
        '    },'+
        '    {'+
        '      \"Id\": 6,'+
        '      \"Height\": 600,'+
        '      \"Width\": 160,'+
        '      \"Name\": \"Wide Skyscraper\"'+
        '    },'+
        '    {'+
        '      \"Id\": 7,'+
        '      \"Height\": 600,'+
        '      \"Width\": 120,'+
        '      \"Name\": \"Skyscraper\"'+
        '    }'+
        '  ]'+
        '}';
        AdzerkAdTypeService obj = parse(json);
        System.assert(obj != null);
    }
}