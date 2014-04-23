(function() {
  var Core, DataSource, Routes, View,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Routes = (function() {
    function Routes(args) {
      this._addEvents = __bind(this._addEvents, this);
      this._registerRoutes = __bind(this._registerRoutes, this);
      if (args) {
        if (args.routes) {
          this._registerRoutes(args.routes);
        }
      }
      return;
    }

    Routes.prototype._registerRoutes = function(routes) {
      var funRoutes, route, view;
      funRoutes = {};
      _.forIn(routes, function(obj, route) {
        obj.initialize();
        return funRoutes[route] = obj.show;
      });
      this.router = new Router(funRoutes);
      this.router.configure({
        before: (function(_this) {
          return function() {
            return $(".row > div").hide();
          };
        })(this)
      });
      this.router.init();
      for (route in routes) {
        view = routes[route];
        this._addEvents(route, view);
      }
      return this;
    };

    Routes.prototype._addEvents = function(route, view) {
      this.router.on(route, (function(_this) {
        return function() {
          PubSub.publish('kronRoute', route);
        };
      })(this));
      return this;
    };

    return Routes;

  })();

  View = (function() {
    function View(el) {
      this.hide = __bind(this.hide, this);
      this.show = __bind(this.show, this);
      var domEl;
      if (el == null) {
        throw "Error: Must pass view a DOM element.";
      } else if (typeof el === 'string') {
        domEl = document.getElementById(el);
        if (!domEl) {
          domEl = document.getElementsByClassName(el)[0];
        }
        this.$el = $(domEl);
        this.id = el;
      } else {
        this.$el = $(el);
        this.id = el.id || el.className;
      }
    }

    View.prototype.show = function() {
      this.$el.show();
    };

    View.prototype.hide = function() {
      this.$el.hide();
    };

    View.prototype.initialize = function() {
      return this;
    };

    return View;

  })();

  DataSource = (function() {
    function DataSource(_source) {
      this._source = _source != null ? _source : {};
      this.get = __bind(this.get, this);
      this.remove = __bind(this.remove, this);
      this.update = __bind(this.update, this);
      this.create = __bind(this.create, this);
      this.login = __bind(this.login, this);
      return this;
    }

    DataSource.prototype.login = function(user, pass, cb) {
      this._source.login(user, pass);
    };

    DataSource.prototype.create = function(item, cb) {
      return this._source.create(item, cb);
    };

    DataSource.prototype.update = function(item, cb) {
      return this.source.update(item, cb);
    };

    DataSource.prototype.remove = function(item, cb) {
      return this._source.remove(item, cb);
    };

    DataSource.prototype.get = function(item, cb) {
      if (item && cb) {
        return this._source.get(item, cb);
      } else if (cb && !item) {
        return this._source.getAll(cb);
      }
    };

    return DataSource;

  })();

  Core = (function() {
    function Core(args) {
      var existingView, r, route, routes, view, views, _ref;
      routes = [];
      views = [];
      if (!args || (args.dataSources == null)) {
        throw "Error: Kronicle requires a datasource.";
      } else {
        if (args.routes) {
          _ref = args.routes;
          for (route in _ref) {
            view = _ref[route];
            if (_.contains(views, views.id)) {
              existingView = _.find(views, view.id);
              routes[route] = existingView;
            } else {
              routes[route] = view;
              views[view.id] = view;
            }
          }
          r = new Routes({
            routes: routes
          });
        }
        if (args.dataSources) {
          this.dataSources = args.dataSources;
        }
      }
      return this;
    }

    return Core;

  })();

  (function(exports) {
    var Kronicle;
    Kronicle = (function() {
      function Kronicle(args) {
        var c, dataSources, dsTypes;
        if (args != null) {
          dsTypes = args.dataSources;
          if (dsTypes != null) {
            dataSources = dsTypes;
            c = new Core({
              routes: args.routes,
              dataSources: dataSources
            });
            return;
          }
        }
        return;
      }

      Kronicle.Core = Core;

      Kronicle.DataSource = DataSource;

      Kronicle.Routes = Routes;

      Kronicle.View = View;

      return Kronicle;

    })();
    return exports.Kronicle = Kronicle;
  })((typeof exports === "undefined" ? this : exports));

  if (typeof define === "function" && define.amd) {
    define("Kronicle", [], function() {
      return Kronicle;
    });
  }

}).call(this);
