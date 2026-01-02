(array/push
  (config :xkb-bindings)
  [:space {:mod4 true :mod1 true} (action/spawn ["footclient"])]
  [:l {:mod4 true} (action/spawn ["fuzzel"])]
  [:u {:mod4 true :mod1 true} (action/close)]
  [:space {:mod4 true} (action/zoom)]
  [:e {:mod4 true} (action/focus :prev)]
  [:a {:mod4 true} (action/focus :next)]
  [:h {:mod4 true} (action/focus-output)]
  [:i {:mod4 true} (action/focus-output)]
  [:t {:mod4 true} (action/fullscreen)]
  [:t {:mod4 true :mod1 true} (action/float)]
  [:p {:mod4 true} (action/spawn ["sh" "-c" "grim -g \"$(slurp)\" - | wl-copy"])]
  [:Escape {:mod4 true :mod1 true :shift true :ctrl true} (action/passthrough)]
  [:0 {:mod4 true} (action/focus-all-tags)])

(for i 1 10
  (def keysym (keyword i))
  (array/push
    (config :xkb-bindings)
    [keysym {:mod4 true} (action/focus-tag i)]
    [keysym {:mod4 true :mod1 true} (action/set-tag i)]
    [keysym {:mod4 true :mod1 true :shift true} (action/toggle-tag i)]))

(array/push
  (config :pointer-bindings)
  [:left {:mod4 :true} (action/pointer-move)]
  [:right {:mod4 :true} (action/pointer-resize)])
