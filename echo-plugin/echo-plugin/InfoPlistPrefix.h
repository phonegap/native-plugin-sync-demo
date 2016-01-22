// info: http://ilya.puchka.me/info-plist-preprocessing/

#import "namespacing.h"

#ifdef NS_NAMESPACE
    #define PLUGIN_WITH_NAMESPACE JRNS_EVALUATE(NS_NAMESPACE, EchoPlugin)
#endif