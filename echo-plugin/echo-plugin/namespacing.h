// source: http://rentzsch.tumblr.com/post/40806448108/ns-poor-mans-namespacing-for-objective-c
#ifndef NS
    #ifdef NS_NAMESPACE
        #define JRNS_CONCAT_TOKENS(a,b) a##b
        #define JRNS_EVALUATE(a,b) JRNS_CONCAT_TOKENS(a,b)
        #define NS(original_name) JRNS_EVALUATE(NS_NAMESPACE, original_name)
    #else
        #define NS(original_name) original_name
    #endif
#endif