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

global with sharing class AdzerkCreativeService {

    public Integer AdvertiserId;
    public String Body;
    public String Url;
    public String Title;
    public Boolean IsSync;
    public Boolean IsDeleted;
    public Integer AdTypeId;
    public String Alt;
    public Boolean IsActive;
    
     public AdzerkCreativeService (JSONParser parser) {
         while (parser.nextToken() != JSONToken.END_OBJECT) {
                        if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                                String text = parser.getText();
                                if (parser.nextToken() != JSONToken.VALUE_NULL) {
                                        if (text == 'AdvertiserId'){
                                            AdvertiserId=Integer.valueof(parser.getText());
                                            } else if (text == 'Body') {
                                             Body=parser.getText();
                                             } else if (text == 'Url') {
                                                Url=parser.getText();
                                             } else if (text == 'Title') {
                                                Title=parser.getText();
                                             }else if (text == 'IsSync') {
                                                IsSync=Boolean.Valueof(parser.getText());
                                             }else if (text == 'IsDeleted') {
                                                IsDeleted=Boolean.Valueof(parser.getText());
                                             }else if (text == 'AdTypeId') {
                                                AdTypeId=Integer.Valueof(parser.getText());
                                             }else if (text == 'Alt') {
                                                Alt=parser.getText();
                                             }else if (text == 'IsActive') {
                                                IsActive=Boolean.Valueof(parser.getText());
                                             }
                                         }
                                   }
                            }
   
         }    
     //Get Creative Data from Adzerk 
     public AdzerkCreativeService (String accessToken, String id, Map<String, String> params) {
                this(System.JSON.createParser(AdzerkUtil.get(accessToken, id, params)));
     }        
     public AdzerkCreativeService (String accessToken, String id) {
                this(accessToken, id, null);
     }
     //Create Creative on Adzerk    
     public AdzerkCreativeService CreateCreative (String accessToken, String id, Map<String, String> params) {
                return new AdzerkCreativeService (System.JSON.createParser(AdzerkUtil.CreateRecord(accessToken, id, params)));
     }
     //Update Creative on Adzerk    
     public AdzerkCreativeService UpdateCreative(String accessToken, String id, Map<String, String> params) {
                return new AdzerkCreativeService (System.JSON.createParser(AdzerkUtil.UpdateRecord(accessToken, id, params)));
     }
     public static AdzerkCreativeService parse(String json) {
                return new AdzerkCreativeService(System.JSON.createParser(json));
     }
    
    static testMethod void testParse() {
        String json = '{'+
        '  \"AdvertiserId\":123,'+
        '  \"Body\":\"Test\",'+
        '  \"Url\":\"http://adzerk.com\",'+
        '  \"Title\":\"Test creative\",'+
        '  \"IsSync\":false,'+
        '  \"IsDeleted\":false,'+
        '  \"AdTypeId\":1,'+
        '  \"Alt\":\"test\",'+
        '  \"IsActive\":true'+
        '}';
        AdzerkCreativeService obj = parse(json);
        System.assert(obj != null);
    }
}