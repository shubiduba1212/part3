const { createProxyMiddleware } = require('http-proxy-middleware');

module.exports = function(app) {
  app.use(
    '/api',
    createProxyMiddleware({
      target: 'http://www.culture.go.kr',
      changeOrigin: true,
    }),
  );
  app.use(
    '/salesapi',
    createProxyMiddleware({
      target: 'http://kopis.or.kr',
      changeOrigin: true,
    }),
  );
};