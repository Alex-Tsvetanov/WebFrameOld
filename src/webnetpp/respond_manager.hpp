struct responcer
{
    public:
        responcer ()
        {
        }

        std::function<response(const path_vars&)> call;

        template<typename Ret, typename... Ts>
        responcer (std::function<Ret(Ts...)> f)
        {
            set (f, std::make_index_sequence<sizeof...(Ts)>{});
        }

        template<typename Ret>
        responcer (std::function<Ret()> f)
        {
            call = [=](const path_vars& vars) -> response {
                return response(f());
            };
        }

    private:
        template<typename Ret, typename... Ts, std::size_t... I>
        void set(std::function<Ret(Ts...)> f, std::index_sequence<I...> seq)
        {
            call = [=](const path_vars& vars) -> response {
                return response(f((Ts(vars[I]))...));
            };
        }

        friend class webnetpp;
};
