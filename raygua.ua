# Experimental!
R ~ "rayua"

DllPath ← "./raygui.so"
Lib ← &ffi ⊂□DllPath

# RAYGUIAPI void GuiEnable(void);                                 // Enable gui controls (global state)
# RAYGUIAPI void GuiDisable(void);                                // Disable gui controls (global state)
# RAYGUIAPI void GuiLock(void);                                   // Lock gui controls (global state)
# RAYGUIAPI void GuiUnlock(void);                                 // Unlock gui controls (global state)
# RAYGUIAPI bool GuiIsLocked(void);    

GuiEnable ← (◌ Lib {"void" "GuiEnable"} {})
GuiDisable ← (◌ Lib {"void" "GuiDisable"} {})
GuiLock ← (◌ Lib {"void" "GuiLock"} {})
GuiUnlock ← (◌ Lib {"void" "GuiUnlock"} {})
GuiIsLocked ← (Lib {"bool" "GuiIsLocked"} {})

# // Container/separator controls, useful for controls organization
# RAYGUIAPI int GuiWindowBox(Rectangle bounds, const char *title);                                       // Window Box control, shows a window that can be closed
# RAYGUIAPI int GuiGroupBox(Rectangle bounds, const char *text);                                         // Group Box control with text name
# RAYGUIAPI int GuiLine(Rectangle bounds, const char *text);                                             // Line separator control, could contain text
# RAYGUIAPI int GuiPanel(Rectangle bounds, const char *text);                                            // Panel control, useful to group controls
# RAYGUIAPI int GuiTabBar(Rectangle bounds, const char **text, int count, int *active);                  // Tab Bar control, returns TAB to be closed or -1
# RAYGUIAPI int GuiScrollPanel(Rectangle bounds, const char *text, Rectangle content, Vector2 *scroll, Rectangle *view); // Scroll Panel control 

GuiWindowBox ← Lib {"int" "GuiWindowBox" R~Rectangle "const char*"} {⊙∘}
GuiGroupBox ← Lib {"int" "GuiGroupBox" R~Rectangle "const char*"} {⊙∘}
GuiLine ← Lib {"int" "GuiLine" R~Rectangle "const char*"} {⊙∘}
GuiPanel ← Lib {"int" "GuiPanel" R~Rectangle "const char*"} {⊙∘}
GuiTabBar ← Lib {"int" "GuiTabBar" R~Rectangle "const char**:2" "int" "int*"} {⊙∘}
GuiScrollPanel ← Lib {"int" "GuiScrollPanel" R~Rectangle "const char*" R~Rectangle $"_*" R~VectorII $"_*" R~Rectangle} {⊙⊙⊙⊙∘}

# // Basic controls set
# RAYGUIAPI int GuiLabel(Rectangle bounds, const char *text);                                            // Label control
# RAYGUIAPI int GuiButton(Rectangle bounds, const char *text);                                           // Button control, returns true when clicked
# RAYGUIAPI int GuiLabelButton(Rectangle bounds, const char *text);                                      // Label button control, returns true when clicked
# RAYGUIAPI int GuiToggle(Rectangle bounds, const char *text, bool *active);                             // Toggle Button control
# RAYGUIAPI int GuiToggleGroup(Rectangle bounds, const char *text, int *active);                         // Toggle Group control
# RAYGUIAPI int GuiToggleSlider(Rectangle bounds, const char *text, int *active);                        // Toggle Slider control
# RAYGUIAPI int GuiCheckBox(Rectangle bounds, const char *text, bool *checked);                          // Check Box control, returns true when active
# RAYGUIAPI int GuiComboBox(Rectangle bounds, const char *text, int *active);                            // Combo Box control
GuiLabel ← Lib {"int" "GuiLabel" R~Rectangle "const char*"} {⊙∘}
GuiButton ← Lib {"int" "GuiButton" R~Rectangle "const char*"} {⊙∘}
GuiLabelButton ← Lib {"int" "GuiLabelButton" R~Rectangle "const char*"} {⊙∘}
GuiToggle ← Lib {"int" "GuiToggle" R~Rectangle "const char*" "unsigned char*"} {⊙⊙∘}
GUiToggleGroup ← Lib {"int" "GuiToggleGroup" R~Rectangle "const char*" "int*"} {⊙⊙∘}
GuiToggleSlider ← Lib {"int" "GuiToggleSlider" R~Rectangle "const char*" "int*"} {⊙⊙∘}
GuiCheckBox ← Lib {"int" "GuiCheckBox" R~Rectangle "const char*" "int*"} {⊙⊙∘}
GuiComboBox ← Lib {"int" "GuiComboBox" R~Rectangle "const char*" "int*"} {⊙⊙∘}

# RAYGUIAPI int GuiDropdownBox(Rectangle bounds, const char *text, int *active, bool editMode);          // Dropdown Box control
# RAYGUIAPI int GuiSpinner(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode); // Spinner control
# RAYGUIAPI int GuiValueBox(Rectangle bounds, const char *text, int *value, int minValue, int maxValue, bool editMode); // Value Box control, updates input text with numbers
# RAYGUIAPI int GuiTextBox(Rectangle bounds, char *text, int textSize, bool editMode);                   // Text Box control, updates input text

# RAYGUIAPI int GuiSlider(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue); // Slider control
# RAYGUIAPI int GuiSliderBar(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue); // Slider Bar control
# RAYGUIAPI int GuiProgressBar(Rectangle bounds, const char *textLeft, const char *textRight, float *value, float minValue, float maxValue); // Progress Bar control
# RAYGUIAPI int GuiStatusBar(Rectangle bounds, const char *text);                                        // Status Bar control, shows info text
# RAYGUIAPI int GuiDummyRec(Rectangle bounds, const char *text);                                         // Dummy control for placeholders
# RAYGUIAPI int GuiGrid(Rectangle bounds, const char *text, float spacing, int subdivs, Vector2 *mouseCell); // Grid control
# 
# // Advance controls set
# RAYGUIAPI int GuiListView(Rectangle bounds, const char *text, int *scrollIndex, int *active);          // List View control
# RAYGUIAPI int GuiListViewEx(Rectangle bounds, const char **text, int count, int *scrollIndex, int *active, int *focus); // List View with extended parameters
# RAYGUIAPI int GuiMessageBox(Rectangle bounds, const char *title, const char *message, const char *buttons); // Message Box control, displays a message
# RAYGUIAPI int GuiTextInputBox(Rectangle bounds, const char *title, const char *message, const char *buttons, char *text, int textMaxSize, bool *secretViewActive); // Text Input Box control, ask for text, supports secret
# RAYGUIAPI int GuiColorPicker(Rectangle bounds, const char *text, Color *color);                        // Color Picker control (multiple color controls)
# RAYGUIAPI int GuiColorPanel(Rectangle bounds, const char *text, Color *color);                         // Color Panel control
# RAYGUIAPI int GuiColorBarAlpha(Rectangle bounds, const char *text, float *alpha);                      // Color Bar Alpha control
# RAYGUIAPI int GuiColorBarHue(Rectangle bounds, const char *text, float *value);                        // Color Bar Hue control
# RAYGUIAPI int GuiColorPickerHSV(Rectangle bounds, const char *text, Vector3 *colorHsv);                // Color Picker control that avoids conversion to RGB on each call (multiple color controls)
# RAYGUIAPI int GuiColorPanelHSV(Rectangle bounds, const char *text, Vector3 *colorHsv);                 // Color Panel control that updates Hue-Saturation-Value color value, used by GuiColorPickerHSV()
