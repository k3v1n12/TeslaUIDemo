#include "hvachandler.h"

HVACHandler::HVACHandler(QObject *parent)
    : QObject{parent}
{

}

int HVACHandler::targetTemperature() const
{
    return m_targetTemperature;
}

void HVACHandler::setTargetTemperature(int newTargetTemperature)
{
    if (m_targetTemperature == newTargetTemperature)
        return;
    m_targetTemperature = newTargetTemperature;
    emit targetTemperatureChanged();
}
