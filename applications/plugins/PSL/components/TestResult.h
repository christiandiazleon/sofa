/******************************************************************************
*       SOFA, Simulation Open-Framework Architecture, development version     *
*                (c) 2006-2017 INRIA, USTL, UJF, CNRS, MGH                    *
*                                                                             *
* This program is free software; you can redistribute it and/or modify it     *
* under the terms of the GNU Lesser General Public License as published by    *
* the Free Software Foundation; either version 2.1 of the License, or (at     *
* your option) any later version.                                             *
*                                                                             *
* This program is distributed in the hope that it will be useful, but WITHOUT *
* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or       *
* FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License *
* for more details.                                                           *
*                                                                             *
* You should have received a copy of the GNU Lesser General Public License    *
* along with this program. If not, see <http://www.gnu.org/licenses/>.        *
*******************************************************************************
*                                                                             *
* Contact information: contact@sofa-framework.org                             *
******************************************************************************/
/******************************************************************************
*  Contributors:                                                              *
*  - damien.marchal@univ-lille1.fr                                            *
******************************************************************************/
#include <PSL/config.h>
#include <sofa/core/objectmodel/BaseObject.h>
using sofa::core::objectmodel::BaseObject ;

namespace sofa
{

namespace component
{

namespace _testresult_
{

class SOFA_PSL_API TestResult : public BaseObject
{
public:
    SOFA_CLASS(TestResult, BaseObject) ;

    TestResult() ;
    virtual ~TestResult();
    virtual void init() override ;

public:
    Data<std::string> m_result ;
};

} // namespace _testresult_

using sofa::component::_testresult_::TestResult ;

} // namespace component

} // namespace sofa
