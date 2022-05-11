import 'package:flutter/material.dart'; 

class AppTextFormInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final VoidCallback? onTapIcon;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? initialValue;
  final Icon? icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? title;
  final String? errorText;
  final int maxLines;
  final Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final Color? bottomBorderColor;
  

  AppTextFormInput({
    Key? key,
    this.hintText,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.onTapIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.title,
    this.errorText,
    this.maxLines = 1,
    this.validator, 
    this.autovalidateMode = AutovalidateMode.always,
    this.readOnly = false,
    this.enableInteractiveSelection = false,
    this.bottomBorderColor,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [ 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // doExist(title) ? 
              true ? 
              Container(
                // color: Colors.red, 
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Text(
                  title ?? "",
                  style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontWeight: FontWeight.w600),
                ),
              ) : Container(),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Theme.of(context).dividerColor,
                  // border: Border.all(color: Theme.of(context).dividerColor),
                  // border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [ 
                    TextFormField(    
                      readOnly: readOnly,
                      enableInteractiveSelection: enableInteractiveSelection,
                      onTap: onTap,
                      initialValue: initialValue,
                      textAlignVertical: TextAlignVertical.center,
                      // onSubmitted: onSubmitted,
                      controller: controller,
                      focusNode: focusNode,
                      onChanged: onChanged,
                      obscureText: obscureText,
                      keyboardType: keyboardType,
                      textInputAction: textInputAction,
                      maxLines: maxLines,
                      validator: validator as String? Function(String?)?,
                      // autovalidateMode: autovalidateMode, 
                      autovalidateMode: AutovalidateMode.onUserInteraction,  
                      decoration: InputDecoration( 
                        enabledBorder: UnderlineInputBorder( 
                          borderSide: BorderSide(
                            color: bottomBorderColor ?? Theme.of(context).dividerColor,
                            width: 2
                          ),
                        ), 
                        fillColor: Theme.of(context).dividerColor,
                        filled: true,
                        hintText: hintText ?? "", 
                        // suffixIcon: doExist(icon) && doExist(controller?.text) ?
                        //   IconButton(
                        //     icon: icon!,
                        //     onPressed: onTapIcon,
                        //   ) : null, 
                        suffixIcon: IconButton(
                          icon: icon!,
                          onPressed: onTapIcon,
                        )  
                      ),
                    ),
                  ],
                ),
              ),  
            ]
          ),
        ],
      ),
    ); 
  }
}
 