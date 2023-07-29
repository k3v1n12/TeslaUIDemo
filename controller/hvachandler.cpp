#include "hvachandler.h"

HVACHandler::HVACHandler(QObject *parent)
    : QObject{parent},
    m_targetTemperature(22)
{

}

int HVACHandler::targetTemperature() const
{
    return m_targetTemperature;
}

void HVACHandler::changeTargetTemperature(const int &val)
{
    int targetTemperature = m_targetTemperature + val;
    setTargetTemperature(targetTemperature);
}

void HVACHandler::setTargetTemperature(int newTargetTemperature)
{
    if (m_targetTemperature == newTargetTemperature)
        return;
    m_targetTemperature = newTargetTemperature;
    emit targetTemperatureChanged();
}
