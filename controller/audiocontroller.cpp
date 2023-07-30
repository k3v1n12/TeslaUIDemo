#include "audiocontroller.h"
#include <QDebug>

AudioController::AudioController(QObject *parent)
    : QObject{parent},
    m_volumeLevel(50)
{

}

int AudioController::volumeLevel() const
{
    return m_volumeLevel;
}

void AudioController::changeVolumeLevel(const int &val)
{
    int volumeLevel = m_volumeLevel + val;
    setVolumeLevel(volumeLevel);
}

void AudioController::setVolumeLevel(int newVolumeLevel)
{
    if (m_volumeLevel == newVolumeLevel)
        return;
    m_volumeLevel = newVolumeLevel;
    emit volumeLevelChanged();
}
