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
 * - Neither the name of the VersatileCapitalist Software, inc, inc nor the names of its contributors 
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

public class AdzerkUtil {
        public static Boolean testmode { get; set; }
        public static String teststubresponse;
        public static String Apiendpoint= 'http://api.adzerk.net/v1/';
        
        static {
                testmode = false;
        }
        
        public static String paramStringFromMap(Map<String,String> params){
                String returned = '';
                for(String key : params.keySet()){
                        if(returned == ''){
                                returned += '?';
                        }
                        else {
                                returned += '&';
                        }
                        //returned += key+'='+EncodingUtil.urlEncode(params.get(key), 'UTF-8');
                        returned += key+'='+params.get(key);
                        
                }
                return returned;
        } 
        
        public static void consumeObject(JSONParser parser) {
                Integer depth = 0;
                do {
                        JSONToken curr = parser.getCurrentToken();
                        if (curr == JSONToken.START_OBJECT || 
                                curr == JSONToken.START_ARRAY) {
                                depth++;
                        } else if (curr == JSONToken.END_OBJECT ||
                                curr == JSONToken.END_ARRAY) {
                                depth--;
                        }
                } while (depth > 0 && parser.nextToken() != null);
        }

    private static String doGet(String url) {
        String response;
            
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        req.setTimeout(60*1000);
        
        HttpResponse res;
        if (testmode) {
                res = new HttpResponse();
                response = teststubresponse;
        } else {
                res = h.send(req);
                response = res.getBody();                
        }
        
        if (res.getStatusCode() >= 400) {
           System.debug('Received a 400'+res.getStatusCode());
        }
        
        //fb returns a 302 temp redirect with the url for the profile image
        if(res.getStatusCode() == 302)
        {
            System.debug('Received a 302, Header Location value is:'+res.getHeader('Location'));
            response = '{"data": [{"url": "'+res.getHeader('Location')+'"},]}';
        } 
        
        System.debug('API RESP: '+response);

        return response;
    }
    
        public static String get(String accessToken, String resource, Map<String, String> params) {
                if(resource!= null && resource!= ''){ 
                // Call params
                if (params == null) {
                    params = new Map<String,String>();
                }

                // Add the access token (required)
                params.put('X-Adzerk-ApiKey', accessToken);

                String endpoint = Apiendpoint + resource+ paramStringFromMap(params);

                return doGet(endpoint);
        } else {                
            System.debug(' Error: ID cannot be null/empty to make an API Call.');
           return null;
        }
        }
        
        public static String get(String accessToken, String id) {
                return get(accessToken, id, null);
        }
        
    /**
     * This methods constructs the param string for a post from a param Map.
     
     */
    public static String postBodyStringFromMap(Map<String,String> params){
        String returned = '';
        for (String key : params.keySet()) {
            if (returned != '') {
                returned += '&';
            }
            returned += key+'='+EncodingUtil.urlEncode(params.get(key), 'UTF-8');  
        }    
      
        return returned;
    }

    /**
     * This methods makes a POST 
     * 
     */
    public static string CreateRecord(String accessToken, String resource, Map<String, String> params) {
       String response;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setHeader('X-Adzerk-ApiKey',accessToken);
         if (params != null) {
            req.setBody(postBodyStringFromMap(params));
            } 
   
        req.setEndpoint(Apiendpoint+resource);
        
        HttpResponse res;
        if(testmode) {
                res = new HttpResponse();
        } else {
                res = h.send(req);
                response=res.getbody();
        }
        
        if(res.getStatusCode() != 200) {
            System.debug('Error POSTing to Graph: '+res);
            System.debug('Request: '+req);
            System.debug('Body: ' + req.getBody());
           
        }
        return response;
    }
  
  /**
     * This methods makes a put
     * 
     */
    public static string UpdateRecord(String accessToken, String resource, Map<String, String> params) {
       String response;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('PUT');
        req.setHeader('X-Adzerk-ApiKey',accessToken);
         if (params != null) {
            req.setBody(postBodyStringFromMap(params));
            } 
   
        req.setEndpoint(Apiendpoint+resource);
        
        HttpResponse res;
        if(testmode) {
                res = new HttpResponse();
        } else {
                res = h.send(req);
                response=res.getbody();
        }
        
        if(res.getStatusCode() != 200) {
            System.debug('Error POSTing to Graph: '+res);
            System.debug('Request: '+req);
            System.debug('Body: ' + req.getBody());
           
        }
        return response;
    }
    public static void deleteItem(String accessToken, String resource) {
        String response;            
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        //req.setMethod('DELETE');
        req.setHeader('X-Adzerk-ApiKey',accessToken);
        req.setEndpoint(Apiendpoint);
        req.setTimeout(60*1000);

        HttpResponse res;
        if (testmode) {
                res = new HttpResponse();
        } else {
                    res = h.send(req);
                    response = res.getBody();
        }
        
        if (res.getStatusCode() >= 400) {
             System.debug(' Error: ID cannot be null/empty to make an API Call.');
        }
        
        System.debug('API RESP: '+response);
    }

     
}