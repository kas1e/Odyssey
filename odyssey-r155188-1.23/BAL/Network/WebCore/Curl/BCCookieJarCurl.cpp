/*
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include "config.h"
#include "PlatformCookieJar.h"
#include "CookieManager.h"

#include "Cookie.h"
#include "KURL.h"
#include <wtf/HashMap.h>
#include <wtf/text/StringHash.h>
#include <wtf/text/WTFString.h>

namespace WebCore {

static HashMap<String, String> cookieJar;

void setCookiesFromDOM(const NetworkStorageSession&, const KURL&, const KURL& url, const String& value)
{
	cookieManager().setCookies(url, value, NoHttpOnlyCookie);
}

String cookiesForDOM(const NetworkStorageSession&, const KURL&, const KURL& url)
{
    return cookieManager().getCookie(url, NoHttpOnlyCookie); 
}

String cookieRequestHeaderFieldValue(const NetworkStorageSession&, const KURL& /*firstParty*/, const KURL& url)
{
    return cookieManager().getCookie(url, WithHttpOnlyCookies);
}

bool cookiesEnabled(const NetworkStorageSession&, const KURL& /*firstParty*/, const KURL& /*url*/)
{
    return true;
}

bool getRawCookies(const NetworkStorageSession&, const KURL& /*firstParty*/, const KURL& url, Vector<Cookie>& rawCookies)
{
    // Note: this method is called by inspector only. No need to check if cookie is enabled.
    Vector<ParsedCookie*> result;
    cookieManager().getRawCookies(result, url, WithHttpOnlyCookies);
    for (size_t i = 0; i < result.size(); i++)
        result[i]->appendWebCoreCookie(rawCookies);
    return true;
}

void deleteCookie(const NetworkStorageSession&, const KURL& url, const String& cookieName)
{
    cookieManager().removeCookieWithName(url, cookieName);
}

void getHostnamesWithCookies(const NetworkStorageSession&, HashSet<String>& hostnames)
{
    // FIXME: Not yet implemented
}

void deleteCookiesForHostname(const NetworkStorageSession&, const String& hostname)
{
    // FIXME: Not yet implemented
}

void deleteAllCookies(const NetworkStorageSession&)
{
    // FIXME: Not yet implemented
}

}
