#include <functional>
#include <type_traits>

namespace detail
{
    template <typename T> struct deduce_type;

    template <typename RETURN_TYPE, typename CLASS_TYPE, typename... ARGS>
    struct deduce_type<RETURN_TYPE(CLASS_TYPE::*)(ARGS...) const>
    { 
        using type = std::function<RETURN_TYPE(ARGS...)>; 
    };
}

template < typename CLOSURE > auto wrap( const CLOSURE& fn )
{ 
    return typename detail::deduce_type<decltype(&CLOSURE::operator())>::type (fn);
}