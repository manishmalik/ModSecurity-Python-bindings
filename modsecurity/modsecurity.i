/*
 * ModSecurity, http://www.modsecurity.org/
 * Copyright (c) 2015 Trustwave Holdings, Inc. (http://www.trustwave.com/)
 *
 * You may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * If any of the files related to licensing are missing or if you have any
 * other questions related to licensing please contact Trustwave Holdings, Inc.
 * directly using the email address security@modsecurity.org.
 *
 * Author: Felipe "Zimmerle" Costa <fcosta at trustwave dot com>
 *
 */

%module modsecurity

%include <std_string.i>
%include <std_sstream.i>
%include <std_vector.i>
%include <std_map.i>
%include <std_multimap.i>
%include "attribute.i"
%include "carrays.i"
%include "typemaps.i"

#%ignore RulesProperties::parserError;

%{
#include "modsecurity/intervention.h"
#include "modsecurity/collection/variable.h"
#include "modsecurity/collection/collection.h"
#include "modsecurity/collection/collections.h"
#include "modsecurity/transaction.h"
#include "modsecurity/debug_log.h"
#include "modsecurity/modsecurity.h"
#include "modsecurity/rules_properties.h"
#include "modsecurity/rules.h"
#include "modsecurity/rule.h"

using std::basic_string;
%}

%rename(_del) modsecurity::collection::Variables::del(const std::string& key);
%rename(_del) modsecurity::collection::Collections::del(const std::string& key);

%immutable modsecurity::ModSecurityIntervention_t::url;
%immutable modsecurity::ModSecurityIntervention_t::log;

%immutable modsecurity::Transaction::m_clientIpAddress;
%immutable modsecurity::Transaction::m_httpVersion;
%immutable modsecurity::Transaction::m_method;
%immutable modsecurity::Transaction::m_serverIpAddress;
%immutable modsecurity::Transaction::m_uri;

%ignore modsecurity::RulesProperties::parserError const;
%ignore modsecurity::Transaction::m_requestBody;
%ignore modsecurity::Transaction::m_responseBody;

%include "modsecurity/intervention.h"
%include "modsecurity/collection/variable.h"
%include "modsecurity/collection/collection.h"
%include "modsecurity/collection/collections.h"
%include "modsecurity/transaction.h"
%include "modsecurity/debug_log.h"
%include "modsecurity/modsecurity.h"
%include "modsecurity/rules_properties.h"
%include "modsecurity/rules.h"
%include "modsecurity/rule.h"


%template(RuleVector) std::vector<modsecurity::Rule *>;
%template(VectorOfRuleVector) std::vector<std::vector<modsecurity::Rule *> >;
%template(StringVector) std::vector<std::string>;

