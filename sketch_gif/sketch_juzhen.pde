import gifAnimation.*;

Gif gif;
String apiUrl = "https://api.giphy.com/v1/gifs/search?";
String apiKey;
String query = "fish";
boolean pause = false;

    void setup() {
       size(800, 600, P2D);
       apiKey=loadStrings("secret.txt")[0];
       imageMode(CENTER);
        gif=getSingleGif(query,35);
    }

    void draw() {
      background(255 / (float)height * mouseY);
      image(gif, width/3 - gif.width/3, height / 3 - gif.height / 3);
    }
    void mousePressed() {
        gif.play();
      
  }


    void keyPressed() {
      gif=getSingleGif(query,35);
      gif.loop();
     if (key == ' ') {
    if (pause) {
      gif.play();
      pause = false;
    } 
    else {
      gif.pause();
      pause = true;
    }
  }
      
    }

ArrayList<String> getGifUrls(String query, int maxGifResults) {
  ArrayList<String> returns = new ArrayList<String>();
  String queryUrl = apiUrl + "&api_key="+ apiKey + "&q="+ query;
  JSONObject json = loadJSONObject(queryUrl);
  JSONArray data = json.getJSONArray("data");
  for(int i=0; i<data.size(); i++) {
    try{
      JSONObject datum = data.getJSONObject(i);
      
      JSONObject images = datum.getJSONObject("images");
      JSONObject original = images.getJSONObject("original");
      String url = original.getString("url").split("\\?")[0];
      String url2 = "https://i.giphy.com/media/"+ url.split("/media/")[1];
      returns.add(url2);
  }catch(Exception e) {}
    if(returns.size() >= maxGifResults) break;
  }
  return returns;
  }
  
  ArrayList<Gif> getGifArray(String query, int maxGifResults) {
    ArrayList<Gif> returns = new ArrayList<Gif>();
    ArrayList<String> urls = getGifUrls(query, maxGifResults);
    for(int i=0; i<urls.size(); i++) {
    try{
    returns.add(new Gif(this, urls.get(i)));
  }catch(Exception e) { }
  if(returns.size() >= maxGifResults) break;
  }
     return returns;
}

  Gif getSingleGif(String query, int maxGifResults) {
    ArrayList<String> urls = getGifUrls(query, maxGifResults);
    Gif returns;
    try{
      returns=new Gif(this, urls.get((int) random(urls.size())));
      return returns;
      }catch(Exception e) {
        returns=null;
      }
      return returns;
    }
