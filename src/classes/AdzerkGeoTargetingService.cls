/**
 * Copyright (c) 2013, VersatileCapitalist Software, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the VersatileCapitalist Software, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/ 

global with sharing class AdzerkGeoTargetingService {
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
    //Get GeoTargeting Data from Adzerk
    public AdzerkGeoTargetingService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
    }       
    public AdzerkGeoTargetingService (String accessToken, String id) {
                this(accessToken, id, null);
    }
     //Create Flight on Adzerk    
    public AdzerkGeoTargetingService CreateGeoTargeting (String accessToken, String id, Map<String, String> params) {
                return new AdzerkGeoTargetingService (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
    }
     //Update Flight on Adzerk    
     public AdzerkGeoTargetingService UpdateGeoTargeting(String accessToken, String id, Map<String, String> params) {
                return new AdzerkGeoTargetingService (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
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