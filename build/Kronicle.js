(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  (function(exports) {
    var View;
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

      return View;

    })();
  });

  exports.View = View;

  if (typeof exports === "undefined") {
    this["View"] = {};
  } else {
    exports;
  }

  if (typeof define === "function" && define.amd) {
    define("View", [], function() {
      return View;
    });
  }

  (function(exports) {
    var Routes;
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
  });

  exports.Routes = Routes;

  if (typeof exports === "undefined") {
    this["Routes"] = {};
  } else {
    exports;
  }

  if (typeof define === "function" && define.amd) {
    define("Routes", [], function() {
      return Routes;
    });
  }

  (function(exports) {
    var DataSource;
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
  });

  exports.DataSource = DataSource;

  if (typeof exports === "undefined") {
    this["DataSource"] = {};
  } else {
    exports;
  }

  if (typeof define === "function" && define.amd) {
    define("DataSource", [], function() {
      return DataSource;
    });
  }

  (function(exports) {
    var Core;
    Core = (function() {
      function Core(args) {
        var existingView, newView, r, route, routes, view, views, _ref;
        routes = [];
        views = [];
        if (!args || (args.dataSource == null)) {
          throw "Error: Kronicle requires a datasource.";
        } else {
          if (args.routes) {
            _ref = args.routes;
            for (route in _ref) {
              view = _ref[route];
              newView = new View(view);
              if (_.contains(views, newView.id)) {
                existingView = _.find(views, newView.id);
                routes[route] = existingView;
              } else {
                routes[route] = newView;
                views[newView.id] = newView;
              }
            }
            r = new Routes({
              routes: routes
            });
          }
        }
        return this;
      }

      return Core;

    })();
  });

  exports.Core = Core;

  if (typeof exports === "undefined") {
    this["Core"] = {};
  } else {
    exports;
  }

  if (typeof define === "function" && define.amd) {
    define("Core", [], function() {
      return Core;
    });
  }

  (function(exports) {
    var Kronicle;
    Kronicle = (function() {
      function Kronicle() {
        var dsType;
        if (typeof pkg !== "undefined" && pkg !== null) {
          dsType = pkg.dataSource;
          if (dsType != null) {
            require(["../app/DataSource/" + dsType], function(dsType) {
              var c, dataSource;
              dataSource = dsType;
              c = new Core({
                routes: pkg.routes,
                dataSource: dataSource
              });
            });
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
    return;
    return exports.Kronicle = Kronicle;
  });

  if (typeof exports === "undefined") {
    this["Kronicle"] = {};
  } else {
    exports;
  }

  if (typeof define === "function" && define.amd) {
    define("Kronicle", [], function() {
      return Kronicle;
    });
  }

}).call(this);
