set -g PROXY_PORT 7897
function proxy
        if test -z "$http_proxy" -a -z "$https_proxy" -a -z "$all_proxy"
                set -gx http_proxy "http://127.0.0.1:$PROXY_PORT"
                set -gx https_proxy "http://127.0.0.1:$PROXY_PORT"
                set -gx all_proxy "socks5://127.0.0.1:$PROXY_PORT"
                echo "Proxy has been set to port $PROXY_PORT"
        else
                set -e http_proxy
                set -e https_proxy
                set -e all_proxy
                echo "Proxy has been unset"
        end
end

