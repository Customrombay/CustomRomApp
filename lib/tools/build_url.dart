String buildUrl({required String baseUrl, required String url}) {
  if (url.startsWith("/")) {
    return baseUrl + url;
  }
  return url;
}