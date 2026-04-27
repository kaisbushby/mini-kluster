                        sudo apt install certbot python3-certbot-dns-cloudflare
                        sudo /opt/certbot/bin/pip install --upgrade certbot certbot-dns-cloudflare
                        sudo certbot certonly --reinstall \
                            --email kaisbushby@gmail.com --agree-tos --no-eff-email \
                            --dns-cloudflare --dns-cloudflare-credentials /etc/letsencrypt/cloudflare.ini \
                            -d kbushby.com -d *.kbushby.com -d *.homelab.kbushby.com && \
                        sudo cp -rL /etc/letsencrypt/live/kbushby.com/. /etc/vault/certs && \
                        sudo chown -R vault:vault /etc/vault/certs
